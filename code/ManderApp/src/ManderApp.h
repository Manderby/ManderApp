
#define MAND_STRINGIFY(A) #A
#define MAND_NALIB_PATH(file) MAND_STRINGIFY(../../../../NALib/code/NALib/src/file)

#include MAND_NALIB_PATH(NAString.h)

void mandInitManderApp(void);
void mandCreateUI(void);

void mandAlertNewVersion(const NAUTF8Char* infoText);
