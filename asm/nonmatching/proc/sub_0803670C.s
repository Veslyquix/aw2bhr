	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803670C
sub_0803670C: @ 0x0803670C
	push {r4, r5, r6, r7, lr}
	ldr r0, _08036724 @ =gUnknown_03004008
	ldr r0, [r0]
	movs r1, #0x2e
	bl __umodsi3
	adds r7, r0, #0
	cmp r7, #0xb
	bhi _08036728
	movs r7, #0
	b _08036736
	.align 2, 0
_08036724: .4byte gUnknown_03004008
_08036728:
	cmp r7, #0x11
	bls _08036734
	cmp r7, #0x27
	bhi _08036734
	movs r7, #2
	b _08036736
_08036734:
	movs r7, #1
_08036736:
	ldr r6, _08036778 @ =gUnknown_081120B0
	ldr r5, _0803677C @ =0x000003FF
	adds r0, r7, #0
	ands r0, r5
	lsls r0, r0, #5
	adds r0, r0, r6
	ldr r4, _08036780 @ =gUnknown_03002B6C
	ldr r1, [r4]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1e
	lsls r1, r1, #0xe
	ldr r2, _08036784 @ =0x06004100
	adds r1, r1, r2
	movs r2, #0x20
	bl sub_08011C68
	lsls r0, r7, #1
	adds r0, #3
	ands r0, r5
	lsls r0, r0, #5
	adds r0, r0, r6
	ldr r1, [r4]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1e
	lsls r1, r1, #0xe
	ldr r2, _08036788 @ =0x06004120
	adds r1, r1, r2
	movs r2, #0x40
	bl sub_08011C68
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08036778: .4byte gUnknown_081120B0
_0803677C: .4byte 0x000003FF
_08036780: .4byte gUnknown_03002B6C
_08036784: .4byte 0x06004100
_08036788: .4byte 0x06004120

