	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801BDB4
sub_0801BDB4: @ 0x0801BDB4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r0
	adds r6, r1, #0
	adds r4, r2, #0
	mov r8, r3
	ldrh r0, [r4]
	adds r4, #2
	ldr r1, _0801BE30 @ =gUnknown_0300141C
	ldr r3, [r1]
	lsls r5, r0, #0x10
	cmp r5, #0
	beq _0801BE22
	mov ip, r1
_0801BDD4:
	ldrh r2, [r4]
	adds r0, r6, #0
	orrs r0, r2
	ldr r7, _0801BE34 @ =0xFFFFFF00
	adds r1, r7, #0
	ands r0, r1
	adds r2, r2, r6
	movs r1, #0xff
	ands r2, r1
	orrs r0, r2
	strh r0, [r3]
	adds r3, #2
	ldrh r2, [r4, #2]
	mov r0, sb
	orrs r0, r2
	ldr r7, _0801BE38 @ =0xFFFFFE00
	adds r1, r7, #0
	ands r0, r1
	add r2, sb
	ldr r7, _0801BE3C @ =0x000001FF
	adds r1, r7, #0
	ands r2, r1
	orrs r0, r2
	strh r0, [r3]
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
	ldr r7, _0801BE40 @ =0xFFFF0000
	adds r5, r5, r7
	asrs r0, r5, #0x10
	cmp r0, #0
	bne _0801BDD4
_0801BE22:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801BE30: .4byte gUnknown_0300141C
_0801BE34: .4byte 0xFFFFFF00
_0801BE38: .4byte 0xFFFFFE00
_0801BE3C: .4byte 0x000001FF
_0801BE40: .4byte 0xFFFF0000

