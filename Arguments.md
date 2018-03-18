# Arguements  explanation
### SOURCE:
/path/to/*.iso /path/to/core{pure64}.gz

(file name)

### TYPE:
hdd zip frugal

(USB-HDD USB-ZIP Frugal)

### TARGET:
sda sda1

(whole_disk partition)

### MARKACTIVE:
1 0

(a boolean)

### FORMAT:
ext2 ext3 ext4 vfat none

### BOOTLOADER:
yes no

### COREPLUS:
yes no

(if the iso file is a coreplus iso)

### COREPLUSINSTALLTYPE:
Core X

### COREPLUSINSTGROUP:
wifi ndiswrapper wififirmware installer remaster kmaps none

(For multiple choices, concat the string with "," without spaces)

### STANDALONEEXTENSIONS:
/path/to/tce /pat/to/cde none

(Install Extensions from the TCE/CDE Directory)

### OPTIONS:
(custom boot codes (optional))
