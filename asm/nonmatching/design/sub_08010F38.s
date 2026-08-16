	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08010F38
sub_08010F38: @ 0x08010F38
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0xb
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r3, r3, r0
	ldrb r0, [r2]
	cmp r0, #0
	beq _08010F88
	ldr r4, _08010F68 @ =gUnknown_0300308C
_08010F50:
	cmp r0, #0x20
	bne _08010F58
	movs r0, #0
	strh r0, [r3]
_08010F58:
	ldrb r0, [r2]
	cmp r0, #0x40
	bls _08010F70
	adds r1, r0, #0
	ldr r5, _08010F6C @ =0x0000FFBF
	adds r0, r5, #0
	ldrh r5, [r4, #2]
	b _08010F78
	.align 2, 0
_08010F68: .4byte gUnknown_0300308C
_08010F6C: .4byte 0x0000FFBF
_08010F70:
	ldrb r1, [r2]
	ldr r5, _08010F90 @ =0x0000FFD0
	adds r0, r5, #0
	ldrh r5, [r4]
_08010F78:
	adds r0, r0, r5
	adds r1, r1, r0
	strh r1, [r3]
	adds r2, #1
	adds r3, #2
	ldrb r0, [r2]
	cmp r0, #0
	bne _08010F50
_08010F88:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08010F90: .4byte 0x0000FFD0

