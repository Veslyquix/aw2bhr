	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08012F40
sub_08012F40: @ 0x08012F40
	push {r4, r5, r6, lr}
	adds r4, r2, #0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	b _08012F60
_08012F4E:
	ldrb r2, [r4]
	adds r4, #1
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_08012E9C
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_08012F60:
	ldrb r0, [r4]
	cmp r0, #0
	bne _08012F4E
	pop {r4, r5, r6}
	pop {r0}
	bx r0

