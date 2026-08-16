	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801EE80
sub_0801EE80: @ 0x0801EE80
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r4, r2, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	str r3, [sp]
	ldrh r2, [r4]
	ldr r1, _0801EF50 @ =gUnknown_0808F0FC
	ldr r6, [r1]
	ldrh r0, [r6]
	lsls r5, r2, #0x10
	asrs r2, r5, #0x10
	adds r0, r0, r2
	cmp r0, #0x10
	bgt _0801EF40
	ldr r1, _0801EF54 @ =gUnknown_03002520
	ldrh r0, [r6]
	lsls r0, r0, #3
	adds r3, r0, r1
	adds r4, #2
	cmp r2, #0
	beq _0801EF40
	movs r0, #0xff
	mov sb, r0
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	adds r1, r0, #0
	mov r2, sb
	ands r1, r2
	str r1, [sp, #4]
	ldr r7, _0801EF58 @ =0x000001FF
	mov ip, r7
	ldr r1, _0801EF5C @ =0xFFFFFF00
	mov r8, r1
	mov r2, r8
	ands r2, r0
	mov r8, r2
	mov r7, sl
	lsls r0, r7, #0x10
	asrs r6, r0, #0x10
_0801EEE2:
	ldrh r2, [r4]
	movs r1, #0xff
	lsls r1, r1, #8
	ands r1, r2
	mov r0, sb
	ands r0, r2
	ldr r2, [sp, #4]
	adds r0, r0, r2
	movs r7, #0xff
	ands r0, r7
	orrs r1, r0
	mov r0, r8
	orrs r1, r0
	strh r1, [r3]
	adds r3, #2
	ldrh r0, [r4, #2]
	movs r2, #0xfe
	lsls r2, r2, #8
	ands r2, r0
	mov r1, ip
	ands r1, r0
	adds r0, r6, #0
	mov r7, ip
	ands r0, r7
	adds r1, r1, r0
	ands r1, r7
	orrs r2, r1
	ldr r0, _0801EF60 @ =0xFFFFFE00
	ands r0, r6
	orrs r2, r0
	strh r2, [r3]
	adds r3, #2
	ldrh r0, [r4, #4]
	ldr r1, [sp]
	adds r0, r1, r0
	strh r0, [r3]
	adds r3, #4
	ldr r1, _0801EF64 @ =gUnknown_03001FE4
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	adds r4, #6
	ldr r2, _0801EF68 @ =0xFFFF0000
	adds r5, r5, r2
	asrs r0, r5, #0x10
	cmp r0, #0
	bne _0801EEE2
_0801EF40:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801EF50: .4byte gUnknown_0808F0FC
_0801EF54: .4byte gUnknown_03002520
_0801EF58: .4byte 0x000001FF
_0801EF5C: .4byte 0xFFFFFF00
_0801EF60: .4byte 0xFFFFFE00
_0801EF64: .4byte gUnknown_03001FE4
_0801EF68: .4byte 0xFFFF0000

