	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801DAB0
sub_0801DAB0: @ 0x0801DAB0
	push {r4, r5, lr}
	movs r1, #0x1f
	ldr r3, _0801DAD0 @ =gUnknown_03001430
	movs r4, #1
_0801DAB8:
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	lsls r0, r1, #1
	adds r2, r0, r3
	movs r5, #0
	ldrsh r0, [r2, r5]
	cmp r0, #0
	bne _0801DAD4
	strh r4, [r2]
	adds r0, r1, #0
	b _0801DAE2
	.align 2, 0
_0801DAD0: .4byte gUnknown_03001430
_0801DAD4:
	subs r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r0, #0
	bge _0801DAB8
	movs r0, #1
	rsbs r0, r0, #0
_0801DAE2:
	pop {r4, r5}
	pop {r1}
	bx r1

