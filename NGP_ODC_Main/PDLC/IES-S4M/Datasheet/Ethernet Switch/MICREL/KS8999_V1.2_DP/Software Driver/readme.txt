KEEPROM.EXE is the Windows version of the EEPROM programming software for the KS89xx switch family. It 
supports KS8995E/KS8995M/KS8997/KS8999/KS8993FM. This program is created based on the source code of its 
DOS version counterpart software.

For Windows NT/2K/XP systems, a special tool called allowio.exe needs to run first in order to access the parallel ports. A batch file "ee.bat" is created to run the EEPROM.EXE under Windows NT/2K/XP.


[History]
V1.0	09/24/02 First release
V1.1 	09/26/02 Fixed download problem. Fixed numbering problem of the error message and verification 		 result display

[The orientation of the bytes are]

Byte 0 : ( Row 0, Column 0 )
Byte 1 : ( Row 0, Column 1 )
Byte 2 : ( Row 0, Column 2 )
 .
 .
 .
Byte 10: ( Row 10, Column 0 )
 .
 .
 .
Byte 20: ( Row 20, Column 0 )
Byte 21: ( Row 20, Column 1 )
 .
 .
 .
Byte 120: ( Row 120, Column 0 )
 

[Menu functions]

1. File 
The following menu items are used to manage the EEPROM image data files on the hard disk.

1.1 New
Set the file buffer to all 0s. This is used for starting a clean sheet for creating a new EEPROM image 

data file.

1.2 Open
Open an existing EEPROM image data file. All the image files have file extension ".dat".

1.3 Save
Save the data in the file buffer to the current opened EEPROM image data file. If there is no current opened file, a dialog box will be displayed for typing a file name to create a new file. Or select an existing file to overwrite.

1.4 Save As
Save the data in the file buffer to a file. A dialog box will be displayed for typing in a file name to 

create a new file. Or select an existing file to overwrite.

2. Tools
The following menu items are used to manage the EEPROM image data inside the current file buffer. 

2.1 Verify
Compare the data in the file buffer against the data inside the EEPROM.

2.2 Upload
Read the data from the EEPROM to the file buffer. The current data in the file buffer will be overwritten.

2.3 Download
Write the data in the file buffer to the EEPROM. All the data in the EEPROM will be overwritten.

2.4 Modify
Bring up an editing window to modify the data in the file buffer.

3. Help
3.1 About box
Display the version number of the software.

[END]
