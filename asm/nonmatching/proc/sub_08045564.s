	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08045564
sub_08045564: @ 0x08045564
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	movs r2, #0x30
	ldrsh r1, [r4, r2]
	ldr r2, [r4, #0x54]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl sub_08025CC8
	ldrb r2, [r0, #4]
	movs r1, #0x80
	rsbs r1, r1, #0
	ands r1, r2
	movs r2, #0x5a
	orrs r1, r2
	strb r1, [r0, #4]
	ldr r0, [r4, #0x2c]
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, [r4, #0x30]
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	movs r6, #0
	ldr r0, _080455C4 @ =gUnknown_030033EC
	ldrh r1, [r0]
	ldr r0, _080455C8 @ =gUnknown_08499598
	ldr r2, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #0x1f]
	cmp r0, #2
	bne _080455AE
	movs r6, #1
_080455AE:
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r6, #0
	bl sub_08044B08
	ldr r0, [r4, #0x2c]
	adds r0, #1
	str r0, [r4, #0x2c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080455C4: .4byte gUnknown_030033EC
_080455C8: .4byte gUnknown_08499598

