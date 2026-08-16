	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801F444
sub_0801F444: @ 0x0801F444
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r4, #0
	ldr r2, _0801F480 @ =gUnknown_0848B738
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r3, [r0, #8]
	ldr r6, [r0]
	cmp r3, r5
	beq _0801F472
	ldr r1, _0801F484 @ =gUnknown_0848B780
	lsls r0, r3, #2
	adds r2, r0, r1
_0801F462:
	ldrb r0, [r2]
	ldrb r1, [r2, #1]
	muls r0, r1, r0
	adds r4, r4, r0
	adds r2, #4
	adds r3, #1
	cmp r3, r5
	bne _0801F462
_0801F472:
	ldr r0, _0801F488 @ =0x000003FF
	ands r4, r0
	lsls r0, r4, #5
	adds r0, r6, r0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0801F480: .4byte gUnknown_0848B738
_0801F484: .4byte gUnknown_0848B780
_0801F488: .4byte 0x000003FF

