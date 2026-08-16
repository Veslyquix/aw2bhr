	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08074834
sub_08074834: @ 0x08074834
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, _08074858 @ =gUnknown_081CC4C0
	ldr r3, [r0]
	movs r2, #0
	adds r5, r0, #0
_08074840:
	movs r6, #0
	ldrsh r0, [r3, r6]
	cmp r0, r4
	beq _0807485C
	adds r3, #0xc
	adds r2, #1
	cmp r2, #0xf
	ble _08074840
_08074850:
	cmp r2, #0x10
	bne _0807486E
	movs r0, #0
	b _08074898
	.align 2, 0
_08074858: .4byte gUnknown_081CC4C0
_0807485C:
	ldrh r0, [r3]
	strh r0, [r1]
	ldrh r0, [r3, #2]
	strh r0, [r1, #2]
	ldrh r0, [r3, #4]
	strh r0, [r1, #4]
	ldr r0, [r3, #8]
	str r0, [r1, #8]
	b _08074850
_0807486E:
	ldr r3, [r5]
	adds r2, #1
	cmp r2, #0xf
	bgt _08074896
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r1, r0, #0
	subs r1, #0xc
	adds r4, r1, r3
	adds r3, r0, r3
_08074884:
	adds r1, r4, #0
	adds r0, r3, #0
	ldm r0!, {r5, r6, r7}
	stm r1!, {r5, r6, r7}
	adds r4, #0xc
	adds r3, #0xc
	adds r2, #1
	cmp r2, #0xf
	ble _08074884
_08074896:
	movs r0, #1
_08074898:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

