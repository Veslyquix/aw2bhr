	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804189C
sub_0804189C: @ 0x0804189C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r6, r1, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r8, r2
	ldr r1, _080418E8 @ =gUnknown_030044B0
	ldr r0, _080418EC @ =gUnknown_03001FD4
	ldr r0, [r0]
	str r0, [r1, #8]
	ldr r0, _080418F0 @ =gUnknown_03003F38
	ldrb r0, [r0]
	bl sub_080251D8
	ldr r4, _080418F4 @ =gUnknown_08091338
	ldr r3, [r4]
	ldr r2, _080418F8 @ =gUnknown_0809133C
	ldr r0, [r2]
	ldr r0, [r0]
	lsls r1, r6, #1
	ldr r7, _080418FC @ =0x0000417A
	adds r0, r0, r7
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r0, r0, r5
	adds r0, r0, r3
	ldrb r3, [r0]
	ldr r0, _08041900 @ =gUnknown_030013D0
	movs r7, #0x14
	ldrsh r1, [r0, r7]
	adds r0, r2, #0
	cmp r3, r1
	bge _08041904
	movs r3, #0
	b _08041906
	.align 2, 0
_080418E8: .4byte gUnknown_030044B0
_080418EC: .4byte gUnknown_03001FD4
_080418F0: .4byte gUnknown_03003F38
_080418F4: .4byte gUnknown_08091338
_080418F8: .4byte gUnknown_0809133C
_080418FC: .4byte 0x0000417A
_08041900: .4byte gUnknown_030013D0
_08041904:
	subs r3, r3, r1
_08041906:
	ldr r2, [r4]
	ldr r0, [r0]
	ldr r0, [r0]
	lsls r1, r6, #1
	ldr r4, _08041948 @ =0x0000417A
	adds r0, r0, r4
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r0, r0, r5
	adds r0, r0, r2
	movs r4, #0
	strb r3, [r0]
	bl sub_0802DCA4
	ldr r0, _0804194C @ =gUnknown_0849FE78
	movs r1, #3
	bl Proc_Start
	str r5, [r0, #0x2c]
	str r6, [r0, #0x30]
	ldr r1, _08041950 @ =gUnknown_030040D8
	ldr r1, [r1]
	str r1, [r0, #0x54]
	str r4, [r0, #0x4c]
	adds r0, #0x64
	mov r7, r8
	strh r7, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08041948: .4byte 0x0000417A
_0804194C: .4byte gUnknown_0849FE78
_08041950: .4byte gUnknown_030040D8

