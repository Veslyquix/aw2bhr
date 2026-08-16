	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08010D80
sub_08010D80: @ 0x08010D80
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r0, _08010DD0 @ =gUnknown_0200B0B0
	ldr r0, [r0]
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x3b
	ble _08010D9E
	adds r0, r5, #0
	bl sub_0800C840
	cmp r0, #0
	beq _08010DCA
_08010D9E:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0x10
	bl SetTerrainAt
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_08010604
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl MakeTileSimple
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl sub_0800C574
	bl sub_080219AC
_08010DCA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08010DD0: .4byte gUnknown_0200B0B0

