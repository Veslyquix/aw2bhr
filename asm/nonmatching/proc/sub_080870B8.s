	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080870B8
sub_080870B8: @ 0x080870B8
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	bne _080870D6
	cmp r5, r4
	bne _080870D6
	cmp r6, r5
	bne _080870D6
	cmp r7, r6
	beq _080870FE
_080870D6:
	movs r0, #0x9f
	movs r1, #0x10
	adds r2, r4, #0
	bl sub_0802BD54
	movs r0, #0xb7
	movs r1, #0x10
	adds r2, r5, #0
	bl sub_0802BD54
	movs r0, #0xcf
	movs r1, #0x10
	adds r2, r6, #0
	bl sub_0802BD54
	movs r0, #0xe7
	movs r1, #0x10
	adds r2, r7, #0
	bl sub_0802BD54
_080870FE:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

