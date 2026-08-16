	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08069EAC
sub_08069EAC: @ 0x08069EAC
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r5, [r4, #0x38]
	cmp r5, #0
	bne _08069F26
	movs r2, #0x30
	rsbs r2, r2, #0
	ldr r3, [r4, #0x40]
	ldr r0, [r4, #0x3c]
	str r0, [sp]
	movs r0, #0
	movs r1, #0xe8
	bl Interpolate
	strh r0, [r4, #0x2a]
	ldrh r0, [r4, #0x2e]
	subs r0, #2
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x28
	rsbs r1, r1, #0
	cmp r0, r1
	bgt _08069EE0
	strh r5, [r4, #0x2e]
_08069EE0:
	ldrh r1, [r4, #0x2a]
	ldrh r2, [r4, #0x2e]
	movs r0, #2
	bl sub_08072C40
	ldrh r0, [r4, #0x2c]
	adds r1, r0, #0
	subs r1, #8
	strh r1, [r4, #0x2c]
	ldrh r0, [r4, #0x30]
	adds r0, #4
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x9f
	bgt _08069F92
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x50
	rsbs r1, r1, #0
	cmp r0, r1
	bgt _08069F0E
	strh r5, [r4, #0x2c]
_08069F0E:
	ldrh r1, [r4, #0x2c]
	ldrh r2, [r4, #0x30]
	movs r0, #3
	bl sub_08072C40
	ldr r0, [r4, #0x40]
	cmp r0, #0x1e
	bne _08069F92
	movs r0, #0
	bl sub_08069D3C
	b _08069F92
_08069F26:
	movs r1, #0x30
	rsbs r1, r1, #0
	movs r2, #0x84
	lsls r2, r2, #1
	ldr r3, [r4, #0x40]
	ldr r0, [r4, #0x3c]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	movs r5, #0
	strh r0, [r4, #0x2a]
	ldrh r0, [r4, #0x2e]
	adds r0, #2
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x27
	ble _08069F4E
	strh r5, [r4, #0x2e]
_08069F4E:
	ldrh r1, [r4, #0x2a]
	ldrh r2, [r4, #0x2e]
	movs r0, #2
	bl sub_08072C40
	ldrh r0, [r4, #0x2c]
	adds r2, r0, #0
	adds r2, #8
	strh r2, [r4, #0x2c]
	ldrh r0, [r4, #0x30]
	subs r0, #4
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x68
	rsbs r1, r1, #0
	cmp r0, r1
	ble _08069F92
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x4f
	ble _08069F7C
	strh r5, [r4, #0x2c]
_08069F7C:
	ldrh r1, [r4, #0x2c]
	ldrh r2, [r4, #0x30]
	movs r0, #3
	bl sub_08072C40
	ldr r0, [r4, #0x40]
	cmp r0, #0x1e
	bne _08069F92
	movs r0, #1
	bl sub_08069D3C
_08069F92:
	ldr r0, [r4, #0x40]
	adds r0, #1
	str r0, [r4, #0x40]
	ldr r1, [r4, #0x3c]
	cmp r0, r1
	bne _08069FA4
	adds r0, r4, #0
	bl Proc_Break
_08069FA4:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

