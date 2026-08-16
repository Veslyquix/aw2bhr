	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802A1E4
sub_0802A1E4: @ 0x0802A1E4
	push {r4, r5, lr}
	ldr r4, _0802A240 @ =gUnknown_08499594
	ldr r2, _0802A244 @ =gUnknown_08499590
	ldr r3, [r2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0xf
	ldr r5, _0802A248 @ =0x0000417A
	adds r2, r3, r5
	adds r2, r2, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r2, [r2]
	adds r0, r0, r2
	adds r3, #0x12
	adds r3, r3, r0
	ldrb r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, [r4]
	adds r3, r1, r0
	ldr r0, _0802A24C @ =gUnknown_03003F2C
	ldrh r2, [r0]
	subs r1, r3, r1
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r1, r0, #4
	adds r0, r0, r1
	lsls r1, r0, #8
	adds r0, r0, r1
	lsls r1, r0, #0x10
	adds r0, r0, r1
	rsbs r0, r0, #0
	asrs r0, r0, #2
	movs r1, #0xc0
	ands r0, r1
	cmp r2, r0
	bne _0802A250
	adds r0, r3, #0
	bl sub_08042084
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802A250
	movs r0, #1
	b _0802A252
	.align 2, 0
_0802A240: .4byte gUnknown_08499594
_0802A244: .4byte gUnknown_08499590
_0802A248: .4byte 0x0000417A
_0802A24C: .4byte gUnknown_03003F2C
_0802A250:
	movs r0, #0
_0802A252:
	pop {r4, r5}
	pop {r1}
	bx r1

