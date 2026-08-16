	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803E01C
sub_0803E01C: @ 0x0803E01C
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	mov ip, r1
	adds r4, r2, #0
	adds r5, r3, #0
	ldr r6, [sp, #0x14]
	ldr r3, _0803E034 @ =gUnknown_02028360
	ldrh r1, [r3, #2]
	movs r2, #0xf0
	lsls r2, r2, #2
	b _0803E03C
	.align 2, 0
_0803E034: .4byte gUnknown_02028360
_0803E038:
	adds r3, #8
	ldrh r1, [r3, #2]
_0803E03C:
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _0803E038
	strb r7, [r3]
	mov r0, ip
	strb r0, [r3, #1]
	movs r2, #7
	ands r4, r2
	ldrb r1, [r3, #2]
	movs r0, #8
	rsbs r0, r0, #0
	ands r0, r1
	orrs r0, r4
	ands r5, r2
	lsls r2, r5, #3
	movs r1, #0x39
	rsbs r1, r1, #0
	ands r0, r1
	orrs r0, r2
	strb r0, [r3, #2]
	movs r0, #0xf
	ands r6, r0
	lsls r2, r6, #6
	ldrh r1, [r3, #2]
	ldr r0, _0803E084 @ =0xFFFFFC3F
	ands r0, r1
	orrs r0, r2
	strh r0, [r3, #2]
	ldr r0, [sp, #0x18]
	strb r0, [r3, #4]
	adds r0, r3, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803E084: .4byte 0xFFFFFC3F

