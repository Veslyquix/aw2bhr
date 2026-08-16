	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08054E8C
sub_08054E8C: @ 0x08054E8C
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x10
	adds r5, r0, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r1, r3, #0x10
	cmp r0, #1
	beq _08054EB4
	cmp r0, #1
	bgt _08054EAE
	cmp r0, #0
	beq _08054EC2
	b _08054ED8
_08054EAE:
	cmp r5, #0x12
	beq _08054ECC
	b _08054ED8
_08054EB4:
	cmp r2, #1
	bne _08054EC2
	adds r0, r4, #0
	bl sub_08054F50
	movs r1, #1
	b _08054ED8
_08054EC2:
	adds r0, r4, #0
	bl sub_08054EE0
	movs r1, #2
	b _08054ED8
_08054ECC:
	cmp r2, #1
	bne _08054ED8
	adds r0, r4, #0
	bl sub_08055004
	movs r1, #3
_08054ED8:
	adds r0, r1, #0
	pop {r4, r5}
	pop {r1}
	bx r1

