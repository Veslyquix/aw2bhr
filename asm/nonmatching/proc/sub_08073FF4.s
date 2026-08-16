	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08073FF4
sub_08073FF4: @ 0x08073FF4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r2, #0
	ldr r0, _08074024 @ =gUnknown_08614220
	bl Proc_Start
	str r4, [r0, #0x2c]
	movs r3, #0
	adds r1, r0, #0
	adds r1, #0x30
	movs r2, #7
_0807400C:
	strh r3, [r1]
	ldrh r0, [r5]
	strh r0, [r1, #0x10]
	adds r5, #2
	adds r1, #2
	subs r2, #1
	cmp r2, #0
	bge _0807400C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08074024: .4byte gUnknown_08614220

