	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08004B7C
sub_08004B7C: @ 0x08004B7C
	push {lr}
	bl sub_0801A614
	bl sub_0801A168
	movs r0, #0x70
	bl sub_0801B780
	ldr r0, _08004BB8 @ =gUnknown_084872FC
	movs r1, #2
	movs r2, #2
	movs r3, #0
	bl sub_0801A148
	movs r0, #7
	bl sub_0800056C
	bl sub_08002DEC
	ldr r0, _08004BBC @ =gUnknown_0200B0B0
	ldr r1, [r0]
	adds r2, r1, #0
	adds r2, #0x46
	movs r0, #0x15
	strh r0, [r2]
	adds r1, #0x48
	movs r0, #0x10
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08004BB8: .4byte gUnknown_084872FC
_08004BBC: .4byte gUnknown_0200B0B0

