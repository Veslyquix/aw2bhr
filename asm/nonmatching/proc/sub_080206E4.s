	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080206E4
sub_080206E4: @ 0x080206E4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov ip, r0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	movs r1, #0
	ldr r2, _0802074C @ =gUnknown_08499590
	ldr r0, [r2]
	ldrh r3, [r0, #2]
	cmp r1, r3
	bge _08020740
	adds r6, r0, #0
	mov r8, r2
_08020700:
	movs r2, #0
	lsls r5, r1, #0x10
	ldrh r4, [r6]
	cmp r2, r4
	bge _08020730
	mov r0, r8
	ldr r3, [r0]
	asrs r1, r5, #0xf
	ldr r4, _08020750 @ =0x0000417A
	adds r0, r3, r4
	adds r4, r0, r1
_08020716:
	ldrh r1, [r4]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	adds r1, r1, r0
	add r1, ip
	strb r7, [r1]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r1, [r3]
	cmp r0, r1
	blt _08020716
_08020730:
	movs r2, #0x80
	lsls r2, r2, #9
	adds r0, r5, r2
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r3, [r6, #2]
	cmp r0, r3
	blt _08020700
_08020740:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802074C: .4byte gUnknown_08499590
_08020750: .4byte 0x0000417A

