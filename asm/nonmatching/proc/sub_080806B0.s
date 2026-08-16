	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080806B0
sub_080806B0: @ 0x080806B0
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	adds r6, r7, #0
	adds r6, #0x4c
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #0x2f
	bgt _08080720
	adds r3, r0, #0
	movs r4, #0x30
	str r4, [sp]
	movs r0, #4
	movs r1, #0x38
	movs r2, #0xa8
	bl Interpolate
	str r0, [r7, #0x2c]
	ldr r5, _08080710 @ =gUnknown_03002020
	movs r1, #0
	ldrsh r3, [r6, r1]
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	strh r0, [r5]
	ldr r5, _08080714 @ =gUnknown_03002B28
	movs r0, #0
	ldrsh r3, [r6, r0]
	str r4, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	strh r0, [r5]
	ldr r0, [r7, #0x2c]
	ldr r1, _08080718 @ =0x000001FF
	ands r0, r1
	movs r1, #0x94
	lsls r1, r1, #3
	ldr r2, _0808071C @ =0x000011CA
	movs r3, #1
	str r3, [sp]
	b _08080756
	.align 2, 0
_08080710: .4byte gUnknown_03002020
_08080714: .4byte gUnknown_03002B28
_08080718: .4byte 0x000001FF
_0808071C: .4byte 0x000011CA
_08080720:
	cmp r0, #0x30
	bne _08080748
	ldr r2, _08080740 @ =0x000011CA
	movs r0, #1
	str r0, [sp]
	movs r0, #0xa8
	movs r1, #0xa0
	movs r3, #0
	bl sub_08043C28
	ldr r0, _08080744 @ =gUnknown_0861693C
	adds r1, r7, #0
	bl Proc_Start
	b _0808077E
	.align 2, 0
_08080740: .4byte 0x000011CA
_08080744: .4byte gUnknown_0861693C
_08080748:
	cmp r0, #0x3f
	bgt _08080764
	ldr r2, _08080760 @ =0x000011CA
	movs r0, #1
	str r0, [sp]
	movs r0, #0xa8
	movs r1, #0xa0
_08080756:
	movs r3, #0
	bl sub_08043C28
	b _0808077E
	.align 2, 0
_08080760: .4byte 0x000011CA
_08080764:
	ldr r2, _08080790 @ =0x000011CA
	movs r0, #1
	str r0, [sp]
	movs r0, #0xa8
	movs r1, #0xa0
	movs r3, #0
	bl sub_08043C28
	movs r0, #0
	strh r0, [r6]
	adds r0, r7, #0
	bl Proc_Break
_0808077E:
	adds r1, r7, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08080790: .4byte 0x000011CA

