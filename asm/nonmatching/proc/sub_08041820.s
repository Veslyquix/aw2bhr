	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08041820
sub_08041820: @ 0x08041820
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	bl sub_0803DF54
	adds r4, r0, #0
	cmp r4, #0
	bne _08041840
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r7, #0
	bl sub_0804189C
	b _0804188E
_08041840:
	ldr r1, _08041860 @ =gUnknown_030044B0
	ldr r0, _08041864 @ =gUnknown_03001FD4
	ldr r0, [r0]
	str r0, [r1, #8]
	ldr r0, _08041868 @ =gUnknown_03003F38
	ldrb r0, [r0]
	bl sub_080251D8
	ldrb r1, [r4, #4]
	ldr r2, _0804186C @ =gUnknown_030013D0
	movs r3, #0x14
	ldrsh r0, [r2, r3]
	cmp r1, r0
	bge _08041870
	movs r0, #0
	b _08041874
	.align 2, 0
_08041860: .4byte gUnknown_030044B0
_08041864: .4byte gUnknown_03001FD4
_08041868: .4byte gUnknown_03003F38
_0804186C: .4byte gUnknown_030013D0
_08041870:
	ldrb r0, [r2, #0x14]
	subs r0, r1, r0
_08041874:
	strb r0, [r4, #4]
	bl sub_0802DCA4
	ldr r0, _08041894 @ =gUnknown_0849FE78
	movs r1, #3
	bl Proc_Start
	ldr r1, _08041898 @ =gUnknown_030040D8
	ldr r1, [r1]
	str r1, [r0, #0x54]
	str r4, [r0, #0x4c]
	adds r0, #0x64
	strh r7, [r0]
_0804188E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08041894: .4byte gUnknown_0849FE78
_08041898: .4byte gUnknown_030040D8

