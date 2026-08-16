	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08080E74
sub_08080E74: @ 0x08080E74
	push {r4, r5, lr}
	adds r4, r1, #0
	adds r5, r2, #0
	ldr r1, _08080EA0 @ =gUnknown_03005970
	str r0, [r1]
	ldr r0, _08080EA4 @ =gUnknown_03005904
	str r4, [r0]
	cmp r4, #1
	bne _08080E8E
	ldr r0, _08080EA8 @ =gUnknown_08616794
	adds r1, r5, #0
	bl Proc_StartBlocking
_08080E8E:
	cmp r4, #2
	bne _08080E9A
	ldr r0, _08080EAC @ =gUnknown_08616844
	adds r1, r5, #0
	bl Proc_StartBlocking
_08080E9A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08080EA0: .4byte gUnknown_03005970
_08080EA4: .4byte gUnknown_03005904
_08080EA8: .4byte gUnknown_08616794
_08080EAC: .4byte gUnknown_08616844

