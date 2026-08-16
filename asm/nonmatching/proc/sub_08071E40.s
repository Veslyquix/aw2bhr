	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08071E40
sub_08071E40: @ 0x08071E40
	push {lr}
	adds r1, r0, #0
	ldr r3, _08071E54 @ =gUnknown_03001FFC
	ldrh r0, [r3]
	cmp r0, #0
	bne _08071E58
	adds r0, r1, #0
	bl Proc_End
	b _08071E7A
	.align 2, 0
_08071E54: .4byte gUnknown_03001FFC
_08071E58:
	adds r2, r1, #0
	adds r2, #0x66
	adds r0, r1, #0
	adds r0, #0x64
	ldrh r1, [r2]
	ldrh r0, [r0]
	subs r1, r1, r0
	strh r1, [r2]
	lsls r1, r1, #0x10
	cmp r1, #0
	bgt _08071E72
	movs r0, #0
	strh r0, [r2]
_08071E72:
	ldrh r0, [r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	strh r0, [r3]
_08071E7A:
	pop {r0}
	bx r0
	.align 2, 0

