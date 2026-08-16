	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801C090
sub_0801C090: @ 0x0801C090
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov ip, r0
	mov sb, r1
	adds r5, r2, #0
	str r3, [sp]
	ldrh r0, [r5]
	str r0, [sp, #4]
	adds r5, #2
	ldr r0, _0801C134 @ =gUnknown_03002F2C
	ldr r6, [r0]
	ldr r1, [sp, #4]
	cmp r1, #0
	bne _0801C0B6
	b _0801C1C6
_0801C0B6:
	movs r0, #0x80
	lsls r0, r0, #5
	mov r2, ip
	ands r0, r2
	cmp r0, #0
	beq _0801C148
	ldrh r4, [r5, #2]
	lsrs r1, r4, #0xe
	lsls r1, r1, #2
	ldrh r2, [r5]
	lsrs r0, r2, #0xe
	lsls r0, r0, #4
	adds r1, r1, r0
	ldr r3, _0801C138 @ =gUnknown_0848B56C
	adds r1, r1, r3
	ldrh r0, [r1]
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	ldr r7, _0801C13C @ =0x000001FF
	mov sl, r7
	mov r3, sl
	ands r3, r4
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r4
	cmp r0, #0
	beq _0801C0F8
	ldr r0, _0801C140 @ =0xFFFFFF00
	orrs r3, r0
	lsls r0, r3, #0x10
	lsrs r3, r0, #0x10
_0801C0F8:
	lsls r3, r3, #0x10
	rsbs r3, r3, #0
	mov r0, sb
	orrs r0, r2
	ldr r1, _0801C140 @ =0xFFFFFF00
	ands r0, r1
	mov r7, sb
	adds r1, r2, r7
	movs r2, #0xff
	ands r1, r2
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	mov r1, ip
	orrs r1, r4
	ldr r2, _0801C144 @ =0xFFFFFE00
	adds r0, r2, #0
	ands r1, r0
	asrs r3, r3, #0x10
	add r3, ip
	mov r2, r8
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r3
	mov r3, sl
	ands r0, r3
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
	b _0801C184
	.align 2, 0
_0801C134: .4byte gUnknown_03002F2C
_0801C138: .4byte gUnknown_0848B56C
_0801C13C: .4byte 0x000001FF
_0801C140: .4byte 0xFFFFFF00
_0801C144: .4byte 0xFFFFFE00
_0801C148:
	ldrh r1, [r5]
	mov r2, sb
	orrs r2, r1
	ldr r7, _0801C1D8 @ =0xFFFFFF00
	ands r2, r7
	add r1, sb
	ldr r0, _0801C1DC @ =gUnknown_03002B20
	ldrh r0, [r0]
	adds r0, r0, r1
	movs r1, #0xff
	ands r0, r1
	orrs r2, r0
	lsls r2, r2, #0x10
	lsrs r7, r2, #0x10
	ldrh r1, [r5, #2]
	mov r2, ip
	orrs r2, r1
	ldr r3, _0801C1E0 @ =0xFFFFFE00
	adds r0, r3, #0
	ands r2, r0
	add r1, ip
	ldr r0, _0801C1E4 @ =gUnknown_030030D0
	ldrh r0, [r0]
	adds r0, r0, r1
	ldr r3, _0801C1E8 @ =0x000001FF
	adds r1, r3, #0
	ands r0, r1
	orrs r2, r0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
_0801C184:
	strh r7, [r6]
	adds r6, #2
	ldr r0, _0801C1EC @ =0x0000CFFF
	ands r2, r0
	ldrh r1, [r5, #2]
	mov r0, ip
	eors r0, r1
	movs r7, #0xc0
	lsls r7, r7, #6
	adds r1, r7, #0
	ands r0, r1
	orrs r2, r0
	strh r2, [r6]
	adds r6, #2
	ldrh r0, [r5, #4]
	ldr r1, [sp]
	adds r0, r0, r1
	strh r0, [r6]
	adds r6, #4
	ldr r2, _0801C1F0 @ =gUnknown_03002F2C
	ldr r0, [r2]
	adds r0, #8
	str r0, [r2]
	adds r5, #6
	ldr r3, [sp, #4]
	lsls r0, r3, #0x10
	ldr r7, _0801C1F4 @ =0xFFFF0000
	adds r0, r0, r7
	lsrs r1, r0, #0x10
	str r1, [sp, #4]
	cmp r0, #0
	beq _0801C1C6
	b _0801C0B6
_0801C1C6:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801C1D8: .4byte 0xFFFFFF00
_0801C1DC: .4byte gUnknown_03002B20
_0801C1E0: .4byte 0xFFFFFE00
_0801C1E4: .4byte gUnknown_030030D0
_0801C1E8: .4byte 0x000001FF
_0801C1EC: .4byte 0x0000CFFF
_0801C1F0: .4byte gUnknown_03002F2C
_0801C1F4: .4byte 0xFFFF0000

