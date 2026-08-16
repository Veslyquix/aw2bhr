	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08012E9C
sub_08012E9C: @ 0x08012E9C
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	cmp r2, #0x2e
	beq _08012EB2
	cmp r2, #0x2c
	bne _08012EBA
_08012EB2:
	movs r2, #0x3c
	bl sub_08012E74
	b _08012F38
_08012EBA:
	cmp r2, #0x2d
	beq _08012EF2
	cmp r2, #0x3d
	beq _08012EF2
	cmp r2, #0x5f
	beq _08012EF2
	cmp r2, #0x28
	bne _08012ED2
	movs r2, #0x3a
	bl sub_08012E74
	b _08012F38
_08012ED2:
	cmp r2, #0x29
	bne _08012EDE
	movs r2, #0x3b
	bl sub_08012E74
	b _08012F38
_08012EDE:
	cmp r2, #0x3a
	beq _08012EF2
	cmp r2, #0x20
	bne _08012EEE
	movs r2, #0x3f
	bl sub_08012E74
	b _08012F38
_08012EEE:
	cmp r2, #0x2f
	bne _08012EFA
_08012EF2:
	movs r2, #0x3d
	bl sub_08012E74
	b _08012F38
_08012EFA:
	cmp r2, #0x25
	bne _08012F06
	movs r2, #0x3e
	bl sub_08012E74
	b _08012F38
_08012F06:
	cmp r2, #0x60
	bls _08012F14
	ldr r3, _08012F10 @ =0x0000FFBF
	b _08012F1A
	.align 2, 0
_08012F10: .4byte 0x0000FFBF
_08012F14:
	cmp r2, #0x40
	bls _08012F2C
	ldr r3, _08012F28 @ =0x0000FFDF
_08012F1A:
	adds r2, r2, r3
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	bl sub_08012E74
	b _08012F38
	.align 2, 0
_08012F28: .4byte 0x0000FFDF
_08012F2C:
	ldr r3, _08012F3C @ =0x0000FFE0
	adds r2, r2, r3
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	bl sub_08012E74
_08012F38:
	pop {r0}
	bx r0
	.align 2, 0
_08012F3C: .4byte 0x0000FFE0

