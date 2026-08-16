	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08073480
sub_08073480: @ 0x08073480
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r0, #0
	ldr r2, _0807354C @ =gUnknown_081CC024
	ldr r3, [r2]
	ldr r0, _08073550 @ =gUnknown_0202F8DC
	str r0, [r3]
	ldr r0, [r4, #0x44]
	ldr r1, [r4, #0x3c]
	adds r0, r0, r1
	str r0, [r4, #0x44]
	ldr r0, [r4, #0x48]
	ldr r1, [r4, #0x40]
	adds r0, r0, r1
	str r0, [r4, #0x48]
	movs r5, #0
	movs r0, #0xff
	mov r8, r0
	ldr r1, _08073554 @ =gSinLut
	mov ip, r1
	ldr r2, [r4, #0x34]
	str r2, [sp]
	asrs r2, r2, #0x10
	mov sl, r2
	ldr r6, [r4, #0x2c]
	asrs r3, r6, #0x10
	mov sb, r3
_080734BE:
	ldr r0, [r4, #0x44]
	adds r0, r5, r0
	ldr r1, [r4, #0x30]
	adds r2, r0, #0
	muls r2, r1, r2
	asrs r2, r2, #8
	ldr r0, [r4, #0x48]
	adds r0, r5, r0
	ldr r1, [r4, #0x38]
	muls r0, r1, r0
	asrs r0, r0, #8
	ldr r7, _08073558 @ =gUnknown_0202FDE4
	ldr r1, [r7]
	lsls r3, r5, #2
	adds r3, r3, r1
	mov r1, r8
	ands r0, r1
	lsls r0, r0, #1
	add r0, ip
	movs r7, #0
	ldrsh r0, [r0, r7]
	ldr r7, [sp]
	adds r1, r0, #0
	muls r1, r7, r1
	asrs r1, r1, #0x14
	add r1, sl
	ldr r7, _0807355C @ =gUnknown_0300200C
	ldrh r0, [r7]
	adds r0, r0, r1
	strh r0, [r3]
	mov r0, r8
	ands r2, r0
	lsls r2, r2, #1
	add r2, ip
	movs r1, #0
	ldrsh r0, [r2, r1]
	adds r1, r0, #0
	muls r1, r6, r1
	asrs r1, r1, #0x14
	add r1, sb
	ldr r2, _08073560 @ =gUnknown_03002000
	ldrh r0, [r2]
	adds r0, r0, r1
	strh r0, [r3, #2]
	adds r5, #1
	cmp r5, #0x9f
	ble _080734BE
	ldr r2, _08073564 @ =0x040000BA
	movs r0, #0
	strh r0, [r2]
	ldr r1, _08073568 @ =0x040000B0
	ldr r0, _08073558 @ =gUnknown_0202FDE4
	ldr r0, [r0]
	str r0, [r1]
	adds r1, #4
	ldr r0, _0807356C @ =0x0400001C
	str r0, [r1]
	adds r1, #4
	movs r0, #1
	strh r0, [r1]
	ldr r3, _08073570 @ =0x0000A640
	adds r0, r3, #0
	strh r0, [r2]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807354C: .4byte gUnknown_081CC024
_08073550: .4byte gUnknown_0202F8DC
_08073554: .4byte gSinLut
_08073558: .4byte gUnknown_0202FDE4
_0807355C: .4byte gUnknown_0300200C
_08073560: .4byte gUnknown_03002000
_08073564: .4byte 0x040000BA
_08073568: .4byte 0x040000B0
_0807356C: .4byte 0x0400001C
_08073570: .4byte 0x0000A640

