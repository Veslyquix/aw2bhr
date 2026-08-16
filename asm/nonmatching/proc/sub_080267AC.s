	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080267AC
sub_080267AC: @ 0x080267AC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r1, _0802684C @ =gUnknown_03004084
	ldr r5, _08026850 @ =gUnknown_08090A74
	ldr r6, [r5]
	ldrh r2, [r6]
	lsls r0, r2, #5
	strh r0, [r1]
	ldr r1, _08026854 @ =gUnknown_03003F2C
	ldrh r0, [r6]
	subs r0, #1
	lsls r0, r0, #6
	strh r0, [r1]
	ldr r0, _08026858 @ =gUnknown_03004480
	strh r2, [r0]
	ldr r0, _0802685C @ =gUnknown_030032C0
	movs r3, #0
	strh r3, [r0]
	ldrh r1, [r6]
	ldr r4, _08026860 @ =gUnknown_08090A78
	ldr r7, [r4]
	ldr r2, [r7]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #0
	strh r1, [r0, #0x16]
	ldrh r1, [r6]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x24
	strb r3, [r0]
	bl sub_08020984
	bl sub_08026F04
	ldrh r0, [r6]
	bl sub_0801A548
	ldrh r0, [r6]
	bl sub_0801A57C
	ldrh r0, [r6]
	bl sub_08043834
	ldr r0, _08026864 @ =gUnknown_03004080
	ldrh r0, [r0]
	mov r8, r5
	mov sb, r4
	cmp r0, #1
	bne _080268BC
	ldrh r0, [r6]
	bl sub_08026D44
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08026868
	ldrh r0, [r6]
	ldr r1, [r7]
	lsls r2, r0, #4
	subs r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r1
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r3, [r0]
	movs r1, #0x7f
	adds r0, r1, #0
	ands r0, r3
	adds r2, #0x2e
	ldrb r2, [r2]
	ands r1, r2
	bl sub_08022AAC
	b _0802688E
	.align 2, 0
_0802684C: .4byte gUnknown_03004084
_08026850: .4byte gUnknown_08090A74
_08026854: .4byte gUnknown_03003F2C
_08026858: .4byte gUnknown_03004480
_0802685C: .4byte gUnknown_030032C0
_08026860: .4byte gUnknown_08090A78
_08026864: .4byte gUnknown_03004080
_08026868:
	ldr r0, _080268EC @ =gUnknown_08499590
	ldr r1, [r0]
	movs r2, #4
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bge _08026876
	adds r0, #0xf
_08026876:
	asrs r0, r0, #4
	adds r2, r0, #7
	movs r3, #6
	ldrsh r0, [r1, r3]
	cmp r0, #0
	bge _08026884
	adds r0, #0xf
_08026884:
	asrs r1, r0, #4
	adds r1, #4
	adds r0, r2, #0
	bl sub_08022AAC
_0802688E:
	mov r0, r8
	ldr r5, [r0]
	ldrh r1, [r5]
	mov r2, sb
	ldr r4, [r2]
	ldr r2, [r4]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r3, _080268F0 @ =gUnknown_030033E4
	ldrh r1, [r3]
	adds r0, #0x2f
	strb r1, [r0]
	ldrh r1, [r5]
	ldr r2, [r4]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r3, #2]
	adds r0, #0x30
	strb r1, [r0]
_080268BC:
	mov r3, r8
	ldr r0, [r3]
	ldrh r2, [r0]
	mov r1, sb
	ldr r0, [r1]
	ldr r0, [r0]
	lsls r1, r2, #4
	subs r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	adds r0, r1, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	adds r1, #0x30
	ldrb r1, [r1]
	bl sub_08022AAC
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080268EC: .4byte gUnknown_08499590
_080268F0: .4byte gUnknown_030033E4

