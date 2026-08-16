	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08039544
sub_08039544: @ 0x08039544
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _08039584 @ =gUnknown_0849D76C
	movs r1, #0
	bl sub_080152EC
	adds r5, r0, #0
	movs r2, #0
	ldrb r0, [r4]
	cmp r0, #0
	beq _08039574
	adds r3, r5, #0
	adds r3, #0x26
_0803955E:
	adds r1, r3, r2
	adds r0, r4, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r0, r4, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803955E
_08039574:
	adds r0, r5, #0
	adds r0, #0x26
	adds r0, r0, r2
	movs r1, #0
	strb r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08039584: .4byte gUnknown_0849D76C

