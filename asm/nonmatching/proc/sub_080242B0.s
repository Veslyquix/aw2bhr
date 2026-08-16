	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080242B0
sub_080242B0: @ 0x080242B0
	push {r4, lr}
	ldr r2, _080242F8 @ =gUnknown_08499590
	ldr r3, [r2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0xf
	ldr r4, _080242FC @ =0x0000417A
	adds r2, r3, r4
	adds r2, r2, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r2, [r2]
	adds r0, r0, r2
	ldr r2, _08024300 @ =0x00001432
	adds r1, r3, r2
	adds r1, r1, r0
	ldrb r1, [r1]
	movs r4, #0xe0
	ands r4, r1
	movs r2, #0x1f
	ands r2, r1
	adds r3, #0x12
	adds r3, r3, r0
	ldrb r0, [r3]
	cmp r0, #0
	bne _08024328
	ldr r0, _08024304 @ =gUnknown_03004084
	ldrh r0, [r0]
	cmp r4, r0
	bne _08024328
	cmp r2, #0xb
	bgt _08024308
	cmp r2, #0xa
	bge _0802431E
	cmp r2, #6
	beq _0802430E
	b _08024328
	.align 2, 0
_080242F8: .4byte gUnknown_08499590
_080242FC: .4byte 0x0000417A
_08024300: .4byte 0x00001432
_08024304: .4byte gUnknown_03004084
_08024308:
	cmp r2, #0xe
	bne _08024328
	b _0802431E
_0802430E:
	ldr r0, _08024324 @ =gUnknown_030033EC
	ldrh r0, [r0]
	bl sub_08043050
	movs r1, #2
	ands r1, r0
	cmp r1, #0
	beq _08024328
_0802431E:
	movs r0, #1
	b _0802432A
	.align 2, 0
_08024324: .4byte gUnknown_030033EC
_08024328:
	movs r0, #0
_0802432A:
	pop {r4}
	pop {r1}
	bx r1

