	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807831C
sub_0807831C: @ 0x0807831C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	str r0, [r4, #0x58]
	ldr r0, [r4, #0x54]
	adds r1, r4, #0
	bl sub_080782C0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08078348
	ldr r2, _08078350 @ =gUnknown_0861500C
	ldr r0, _08078354 @ =gUnknown_0202FDFC
	ldr r0, [r0, #0xc]
	ldr r1, [r4, #0x58]
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldr r0, [r0]
	adds r1, r4, #0
	bl sub_08074AAC
_08078348:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08078350: .4byte gUnknown_0861500C
_08078354: .4byte gUnknown_0202FDFC

