	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08014878
sub_08014878: @ 0x08014878
	push {lr}
	ldr r0, _08014890 @ =gUnknown_08489530
	bl sub_0801537C
	ldr r0, _08014894 @ =gUnknown_08489548
	bl sub_0801537C
	ldr r0, _08014898 @ =gUnknown_08489568
	bl sub_0801537C
	pop {r0}
	bx r0
	.align 2, 0
_08014890: .4byte gUnknown_08489530
_08014894: .4byte gUnknown_08489548
_08014898: .4byte gUnknown_08489568

