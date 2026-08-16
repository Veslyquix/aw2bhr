	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08030600
sub_08030600: @ 0x08030600
	push {r4, r5, lr}
	ldr r4, _08030658 @ =gUnknown_08090CCC
	ldr r0, [r4]
	ldr r1, [r0]
	ldrh r0, [r1, #4]
	movs r2, #0
	movs r0, #0
	strh r0, [r1, #4]
	ldrb r0, [r1, #1]
	strb r2, [r1, #1]
	bl sub_0802F03C
	ldr r1, _0803065C @ =gUnknown_030040C0
	movs r0, #0x88
	strh r0, [r1, #0xa]
	strh r0, [r1, #6]
	ldr r1, _08030660 @ =gUnknown_0300410C
	ldr r0, _08030664 @ =gUnknown_030040CC
	ldrh r0, [r0]
	strh r0, [r1]
	adds r5, r4, #0
	ldr r4, _08030668 @ =gUnknown_03003128
	ldr r3, _0803066C @ =gUnknown_03003F48
	movs r2, #3
_08030630:
	ldrh r0, [r4]
	ldrh r1, [r3]
	strh r0, [r3]
	adds r4, #2
	adds r3, #2
	subs r2, #1
	cmp r2, #0
	bge _08030630
	ldr r2, [r5]
	ldr r1, [r2]
	ldrb r0, [r1, #1]
	movs r0, #1
	strb r0, [r1, #1]
	ldr r1, [r2]
	ldrh r0, [r1, #4]
	movs r0, #6
	strh r0, [r1, #4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08030658: .4byte gUnknown_08090CCC
_0803065C: .4byte gUnknown_030040C0
_08030660: .4byte gUnknown_0300410C
_08030664: .4byte gUnknown_030040CC
_08030668: .4byte gUnknown_03003128
_0803066C: .4byte gUnknown_03003F48

