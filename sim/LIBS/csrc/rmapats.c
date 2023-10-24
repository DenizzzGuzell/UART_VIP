// file = 0; split type = patterns; threshold = 100000; total count = 0.
#include <stdio.h>
#include <stdlib.h>
#include <strings.h>
#include "rmapats.h"

void  hsG_0__0 (struct dummyq_struct * I1361, EBLK  * I1356, U  I709);
void  hsG_0__0 (struct dummyq_struct * I1361, EBLK  * I1356, U  I709)
{
    U  I1620;
    U  I1621;
    U  I1622;
    struct futq * I1623;
    struct dummyq_struct * pQ = I1361;
    I1620 = ((U )vcs_clocks) + I709;
    I1622 = I1620 & ((1 << fHashTableSize) - 1);
    I1356->I754 = (EBLK  *)(-1);
    I1356->I755 = I1620;
    if (0 && rmaProfEvtProp) {
        vcs_simpSetEBlkEvtID(I1356);
    }
    if (I1620 < (U )vcs_clocks) {
        I1621 = ((U  *)&vcs_clocks)[1];
        sched_millenium(pQ, I1356, I1621 + 1, I1620);
    }
    else if ((peblkFutQ1Head != ((void *)0)) && (I709 == 1)) {
        I1356->I757 = (struct eblk *)peblkFutQ1Tail;
        peblkFutQ1Tail->I754 = I1356;
        peblkFutQ1Tail = I1356;
    }
    else if ((I1623 = pQ->I1264[I1622].I777)) {
        I1356->I757 = (struct eblk *)I1623->I775;
        I1623->I775->I754 = (RP )I1356;
        I1623->I775 = (RmaEblk  *)I1356;
    }
    else {
        sched_hsopt(pQ, I1356, I1620);
    }
}
#ifdef __cplusplus
extern "C" {
#endif
void SinitHsimPats(void);
#ifdef __cplusplus
}
#endif
