	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08049264
sub_08049264: @ 0x08049264
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r5, r0, #0
	movs r1, #0x1e
	ldrsh r0, [r5, r1]
	adds r0, #2
	cmp r0, #9
	bgt _080492F8
	ldr r4, _080492F0 @ =gUnknown_08499578
	ldr r0, [r4]
	ldrh r2, [r5, #0x1e]
	adds r2, #7
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r1, #1
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	movs r3, #0x12
	bl sub_08012BC8
	movs r2, #0
	movs r0, #0x1e
	ldrsh r1, [r5, r0]
	movs r0, #5
	subs r0, r0, r1
	cmp r2, r0
	bge _08049300
	mov r8, r4
	ldr r1, _080492F4 @ =gUnknown_084C30F8
	mov ip, r1
	movs r7, #0x80
	lsls r7, r7, #2
_080492AA:
	movs r3, #0
	adds r6, r2, #1
	lsls r4, r2, #5
_080492B0:
	movs r2, #0x1e
	ldrsh r1, [r5, r2]
	mov r2, r8
	ldr r0, [r2]
	lsls r1, r1, #5
	adds r1, r1, r3
	lsls r1, r1, #1
	adds r1, r1, r0
	adds r1, r1, r7
	mov r2, ip
	ldr r0, [r2]
	adds r2, r4, r3
	lsls r2, r2, #1
	adds r0, #0x32
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x13
	bls _080492B0
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	movs r0, #0x1e
	ldrsh r1, [r5, r0]
	movs r0, #5
	subs r0, r0, r1
	cmp r2, r0
	blt _080492AA
	b _08049300
	.align 2, 0
_080492F0: .4byte gUnknown_08499578
_080492F4: .4byte gUnknown_084C30F8
_080492F8:
	ldr r0, _08049318 @ =gUnknown_03001FBC
	ldrb r0, [r0]
	bl sub_08015C30
_08049300:
	bl sub_08013AEC
	ldrh r0, [r5, #0x1e]
	adds r0, #1
	strh r0, [r5, #0x1e]
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08049318: .4byte gUnknown_03001FBC

