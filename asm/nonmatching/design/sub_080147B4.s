	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080147B4
sub_080147B4: @ 0x080147B4
	push {r4, r5, r6, lr}
	mov ip, r0
	ldr r0, [sp, #0x10]
	ldr r6, [sp, #0x14]
	ldr r5, [sp, #0x18]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r0, r0, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r4, _0801481C @ =gUnknown_08610A38
	lsrs r0, r0, #0xe
	adds r0, r0, r4
	ldr r0, [r0]
	mov r4, ip
	str r0, [r4, #0x20]
	movs r0, #0
	str r0, [r4, #0x24]
	str r3, [r4, #0x28]
	movs r3, #0
	strh r6, [r4, #0x2c]
	strh r0, [r4, #0x2e]
	strh r5, [r4, #0x36]
	strh r5, [r4, #0x34]
	mov r0, ip
	adds r0, #0x38
	strb r3, [r0]
	subs r0, #8
	strb r1, [r0]
	adds r0, #1
	strb r2, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r2, [r0]
	mov r1, ip
	adds r1, #0x39
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #1
	movs r0, #2
	strb r0, [r1]
	ldr r0, _08014820 @ =sub_08013AEC
	str r0, [r4, #0x3c]
	mov r0, ip
	adds r0, #0x40
	strb r3, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801481C: .4byte gUnknown_08610A38
_08014820: .4byte sub_08013AEC

