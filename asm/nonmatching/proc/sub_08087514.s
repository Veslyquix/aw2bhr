	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08087514
sub_08087514: @ 0x08087514
	push {r4, lr}
	adds r3, r0, #0
	adds r4, r2, #0
	cmp r3, #1
	bhi _08087520
	movs r3, #2
_08087520:
	movs r0, #5
	subs r3, r0, r3
	adds r0, r3, #0
	adds r0, #0xb8
	ldr r3, _08087544 @ =gUnknown_08499578
	lsls r2, r1, #1
	adds r1, r4, #5
	adds r2, r2, r1
	lsls r2, r2, #6
	adds r2, #0x12
	ldr r1, [r3]
	adds r1, r1, r2
	bl sub_0801F2AC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08087544: .4byte gUnknown_08499578

