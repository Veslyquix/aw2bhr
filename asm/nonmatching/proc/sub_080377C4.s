	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080377C4
sub_080377C4: @ 0x080377C4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sl, r0
	ldr r0, _08037888 @ =0x00000A14
	bl sub_08014E44
	bl sub_08037B84
	ldr r3, _0803788C @ =gUnknown_08090EF8
	ldr r1, [r3]
	ldr r2, [r1]
	ldr r4, _08037890 @ =gUnknown_08499590
	ldr r0, [r4]
	ldrh r0, [r0]
	strb r0, [r2]
	ldr r1, [r1]
	ldr r0, [r4]
	ldrh r0, [r0, #2]
	strb r0, [r1, #1]
	movs r1, #0
	ldr r0, [r4]
	ldrh r0, [r0, #2]
	cmp r1, r0
	bge _0803784A
	adds r6, r4, #0
_080377FE:
	movs r4, #0
	ldr r0, [r6]
	adds r2, r1, #1
	str r2, [sp]
	ldrh r0, [r0]
	cmp r4, r0
	bge _08037840
	ldr r7, _08037894 @ =gUnknown_03003F68
	mov sb, r7
	lsls r5, r1, #1
	ldr r0, _08037898 @ =0x0000417A
	mov r8, r0
	ldr r1, _0803789C @ =0x00000A22
	mov ip, r1
_0803781A:
	mov r7, sb
	ldr r2, [r7]
	ldr r3, [r6]
	mov r1, r8
	adds r0, r3, r1
	adds r0, r0, r5
	ldrh r1, [r0]
	adds r1, r1, r4
	lsls r1, r1, #1
	adds r2, r2, r1
	mov r7, ip
	adds r0, r3, r7
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2, #2]
	adds r4, #1
	ldrh r3, [r3]
	cmp r4, r3
	blt _0803781A
_08037840:
	ldr r1, [sp]
	ldr r0, [r6]
	ldrh r0, [r0, #2]
	cmp r1, r0
	blt _080377FE
_0803784A:
	mov r0, sl
	bl sub_0801B6EC
	mov r0, sl
	bl sub_0801B6FC
	ldr r2, _080378A0 @ =gUnknown_03001FF8
	ldr r0, _08037894 @ =gUnknown_03003F68
	ldr r0, [r0]
	ldrb r1, [r0]
	lsls r1, r1, #2
	subs r1, #0xf0
	asrs r1, r1, #1
	strh r1, [r2]
	ldr r2, _080378A4 @ =gUnknown_03001418
	ldrb r1, [r0, #1]
	lsls r1, r1, #2
	subs r1, #0xa0
	asrs r1, r1, #1
	strh r1, [r2]
	bl sub_08014ED4
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08037888: .4byte 0x00000A14
_0803788C: .4byte gUnknown_08090EF8
_08037890: .4byte gUnknown_08499590
_08037894: .4byte gUnknown_03003F68
_08037898: .4byte 0x0000417A
_0803789C: .4byte 0x00000A22
_080378A0: .4byte gUnknown_03001FF8
_080378A4: .4byte gUnknown_03001418

