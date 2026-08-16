	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803CD2C
sub_0803CD2C: @ 0x0803CD2C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	lsls r1, r1, #0x18
	ldr r5, _0803CD9C @ =gUnknown_02000000
	movs r0, #0xa0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	lsrs r4, r1, #0x18
	adds r0, r4, #0
	bl sub_0801AD70
	adds r7, r0, #0
	cmp r7, #0
	bne _0803CDAC
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0801AC58
	adds r0, r5, #0
	bl sub_08037B84
	adds r0, r5, #0
	bl sub_0803D6FC
	ldr r0, _0803CDA0 @ =gUnknown_03001418
	mov r8, r0
	ldrh r5, [r0]
	ldr r6, _0803CDA4 @ =gUnknown_03001FF8
	ldrh r4, [r6]
	ldr r0, _0803CDA8 @ =gUnknown_03001FE8
	ldr r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	lsls r0, r0, #0xe
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r0, r0, r1
	str r7, [sp]
	movs r1, #5
	str r1, [sp, #4]
	mov r1, sb
	movs r2, #1
	movs r3, #0
	bl sub_080376DC
	mov r0, r8
	strh r5, [r0]
	strh r4, [r6]
	movs r0, #1
	b _0803CDAE
	.align 2, 0
_0803CD9C: .4byte gUnknown_02000000
_0803CDA0: .4byte gUnknown_03001418
_0803CDA4: .4byte gUnknown_03001FF8
_0803CDA8: .4byte gUnknown_03001FE8
_0803CDAC:
	movs r0, #0
_0803CDAE:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

