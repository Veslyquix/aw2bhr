	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804A6D8
sub_0804A6D8: @ 0x0804A6D8
	push {r4, r5, r6, lr}
	movs r4, #0
	movs r0, #0
	bl sub_0804A1E4
	movs r3, #0
	ldr r1, _0804A738 @ =gUnknown_0812A280
	ldr r0, [r1]
	ldr r0, [r0]
	adds r2, r0, #0
	adds r2, #0x5f
	ldrb r2, [r2]
	adds r6, r1, #0
	cmp r4, r2
	bhs _0804A71A
	adds r5, r0, #0
	adds r5, #0x2c
	ldr r0, _0804A73C @ =gUnknown_084C3D12
	ldrb r1, [r0]
_0804A6FE:
	adds r0, r5, r3
	ldrb r0, [r0]
	cmp r0, r1
	beq _0804A710
	cmp r0, #0
	beq _0804A710
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_0804A710:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, r2
	blo _0804A6FE
_0804A71A:
	cmp r4, #0
	beq _0804A744
	ldr r0, [r6]
	ldr r0, [r0]
	adds r0, #0x63
	movs r1, #2
	strb r1, [r0]
	ldr r0, _0804A740 @ =gUnknown_084C398C
	bl sub_080193B0
	movs r0, #0x71
	bl sub_0803B4DC
	b _0804A758
	.align 2, 0
_0804A738: .4byte gUnknown_0812A280
_0804A73C: .4byte gUnknown_084C3D12
_0804A740: .4byte gUnknown_084C398C
_0804A744:
	ldr r0, [r6]
	ldr r0, [r0]
	adds r0, #0x63
	movs r1, #1
	strb r1, [r0]
	bl sub_0804AE10
	movs r0, #0x68
	bl sub_0803B4DC
_0804A758:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

