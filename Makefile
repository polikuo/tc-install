PREFIX = /usr/local
INSTDIR = $(DESTDIR)/$(PREFIX)/bin

TARGET = tc-install
OBJ = tc-install.o

ARCH := $(shell uname -m)
CXX_FLAGS_i686 := -march=i486 -mtune=i686
CXX_FLAGS_x86_64 := -mtune=generic
CXXFLAGS += $(CXX_FLAGS_$(ARCH))
CXXFLAGS += -Os -s -Wall -Wextra
CXXFLAGS += -fno-rtti -fno-exceptions
CXXFLAGS += -ffunction-sections -fdata-sections

LDFLAGS += -Wl,-O1 -Wl,-gc-sections
LDFLAGS += -Wl,-as-needed

CXXFLAGS += $(shell fltk-config --cxxflags | sed 's@-I@-isystem @')
LDFLAGS += $(shell fltk-config --ldflags)

.PHONY: all clean install

%.o : %.cxx
	$(CXX) -c $(CXXFLAGS) $(CPPFLAGS) $< -o $@

all: $(OBJ)
	$(CXX) -o $(TARGET) $(OBJ) $(CXXFLAGS) $(LDFLAGS)
	sstrip $(TARGET)

clean:
	rm -f $(TARGET) $(OBJ)

install: all
	mkdir -p $(INSTDIR)
	cp -a $(TARGET) $(INSTDIR)
	cp tc-install.sh fetch_devices $(INSTDIR)
	chmod 755 $(INSTDIR)/tc-install.sh $(INSTDIR)/fetch_devices
