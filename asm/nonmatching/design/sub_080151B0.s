	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080151B0
sub_080151B0: @ 0x080151B0
	push {r4, r5, r6, lr}
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r3, _08015220 @ =gUnknown_03001470
	mov ip, r3
	lsls r3, r1, #1
	adds r3, r3, r1
	lsls r3, r3, #5
	mov r1, ip
	adds r5, r3, r1
	str r0, [r5]
	adds r1, #4
	adds r1, r3, r1
	str r0, [r1]
	movs r4, #0
	strh r4, [r5, #0x10]
	mov r0, ip
	adds r0, #0xc
	adds r0, r3, r0
	str r4, [r0]
	strh r4, [r5, #0x38]
	strb r2, [r5, #0x14]
	mov r0, ip
	adds r0, #0x18
	adds r0, r3, r0
	str r4, [r0]
	mov r0, ip
	adds r0, #8
	adds r0, r3, r0
	str r4, [r0]
	mov r6, ip
	adds r6, #0x28
	adds r6, r3, r6
	mov r2, ip
	adds r2, #0x2c
	adds r2, r3, r2
	mov r1, ip
	adds r1, #0x30
	adds r1, r3, r1
	mov r0, ip
	adds r0, #0x34
	adds r3, r3, r0
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r3]
	str r0, [r1]
	str r0, [r2]
	str r0, [r6]
	strh r4, [r5, #0x24]
	strh r4, [r5, #0x22]
	strh r4, [r5, #0x20]
	strh r4, [r5, #0x1e]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08015220: .4byte gUnknown_03001470

