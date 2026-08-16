	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801BD00
sub_0801BD00: @ 0x0801BD00
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	adds r6, r1, #0
	adds r4, r2, #0
	mov r8, r3
	ldrh r0, [r4]
	adds r4, #2
	ldr r1, _0801BD98 @ =gUnknown_03002F2C
	ldr r3, [r1]
	lsls r5, r0, #0x10
	cmp r5, #0
	beq _0801BD88
	ldr r0, _0801BD9C @ =gUnknown_03002B20
	mov sl, r0
	ldr r7, _0801BDA0 @ =gUnknown_030030D0
	mov sb, r7
	mov ip, r1
_0801BD2C:
	ldrh r1, [r4]
	adds r2, r6, #0
	orrs r2, r1
	ldr r7, _0801BDA4 @ =0xFFFFFF00
	adds r0, r7, #0
	ands r2, r0
	adds r1, r1, r6
	mov r7, sl
	ldrh r0, [r7]
	adds r0, r0, r1
	movs r1, #0xff
	ands r0, r1
	orrs r2, r0
	strh r2, [r3]
	adds r3, #2
	ldrh r1, [r4, #2]
	ldr r2, [sp]
	orrs r2, r1
	ldr r7, _0801BDA8 @ =0xFFFFFE00
	adds r0, r7, #0
	ands r2, r0
	ldr r0, [sp]
	adds r1, r1, r0
	mov r7, sb
	ldrh r0, [r7]
	adds r0, r0, r1
	ldr r7, _0801BDAC @ =0x000001FF
	adds r1, r7, #0
	ands r0, r1
	orrs r2, r0
	strh r2, [r3]
	adds r3, #2
	ldrh r0, [r4, #4]
	add r0, r8
	strh r0, [r3]
	adds r3, #4
	mov r1, ip
	ldr r0, [r1]
	adds r0, #8
	str r0, [r1]
	adds r4, #6
	ldr r7, _0801BDB0 @ =0xFFFF0000
	adds r5, r5, r7
	asrs r0, r5, #0x10
	cmp r0, #0
	bne _0801BD2C
_0801BD88:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801BD98: .4byte gUnknown_03002F2C
_0801BD9C: .4byte gUnknown_03002B20
_0801BDA0: .4byte gUnknown_030030D0
_0801BDA4: .4byte 0xFFFFFF00
_0801BDA8: .4byte 0xFFFFFE00
_0801BDAC: .4byte 0x000001FF
_0801BDB0: .4byte 0xFFFF0000

