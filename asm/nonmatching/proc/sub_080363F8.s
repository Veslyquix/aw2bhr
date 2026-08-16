	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080363F8
sub_080363F8: @ 0x080363F8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	mov r8, r1
	lsls r0, r0, #0x10
	asrs r7, r0, #0x10
	mov r0, sp
	adds r1, r7, #0
	bl sub_08015638
	ldr r0, [sp]
	ldr r1, [sp, #4]
	lsls r5, r1, #0x16
	lsrs r0, r5, #0x16
	mov r1, r8
	ldrh r4, [r1, #4]
	subs r6, r4, r0
	ldr r2, _08036470 @ =0x000003FF
	adds r0, r2, #0
	ands r6, r0
	adds r0, r6, #0
	movs r1, #9
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r2, #0xfc
	lsls r2, r2, #8
	ands r2, r4
	adds r2, r0, r2
	lsrs r1, r5, #0x16
	adds r1, r1, r2
	mov r2, r8
	strh r1, [r2, #4]
	cmp r0, #0
	bne _08036464
	ldr r1, _08036474 @ =gUnknown_03001470
	lsls r0, r7, #1
	adds r0, r0, r7
	lsls r0, r0, #5
	adds r1, #0x18
	adds r0, r0, r1
	ldr r0, [r0]
	lsls r1, r6, #5
	ldr r0, [r0, #0x48]
	adds r0, r0, r1
	lsrs r1, r5, #0x11
	ldr r2, _08036478 @ =0x06010000
	adds r1, r1, r2
	movs r2, #0x90
	lsls r2, r2, #1
	bl sub_08011E54
_08036464:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08036470: .4byte 0x000003FF
_08036474: .4byte gUnknown_03001470
_08036478: .4byte 0x06010000

