	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080852A8
sub_080852A8: @ 0x080852A8
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	ldr r7, _08085398 @ =gUnknown_03005940
	ldr r5, [r7]
	cmp r5, #3
	bgt _080852EE
	ldr r0, _0808539C @ =gUnknown_08499578
	ldr r2, [r0]
	ldr r4, _080853A0 @ =gUnknown_08616F0C
	adds r0, r6, #0
	adds r0, #0x66
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, _080853A4 @ =gUnknown_08499598
	ldr r3, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #2
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r3, [r0]
	movs r0, #0x80
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #0x3f
	str r0, [sp, #4]
	movs r0, #1
	movs r1, #7
	bl sub_08014668
_080852EE:
	ldr r0, [r7]
	cmp r0, #2
	bne _0808533C
	movs r0, #0
	bl sub_0801B780
	ldr r0, _0808539C @ =gUnknown_08499578
	ldr r2, [r0]
	ldr r5, _080853A8 @ =gUnknown_08610A38
	ldr r3, _080853AC @ =gUnknown_085D3DD0
	adds r0, r6, #0
	adds r0, #0x66
	movs r4, #0
	ldrsh r1, [r0, r4]
	ldr r0, _080853A4 @ =gUnknown_08499598
	ldr r4, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrb r1, [r0, #0x1d]
	lsls r0, r1, #6
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r3, #0x7c
	adds r0, r0, r3
	ldr r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r3, [r0]
	movs r0, #0x80
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #3
	movs r1, #5
	bl sub_080149C0
_0808533C:
	ldr r0, [r7]
	cmp r0, #3
	bne _0808538A
	movs r0, #0
	bl sub_0801B780
	ldr r0, _0808539C @ =gUnknown_08499578
	ldr r2, [r0]
	ldr r5, _080853A8 @ =gUnknown_08610A38
	ldr r3, _080853AC @ =gUnknown_085D3DD0
	adds r0, r6, #0
	adds r0, #0x66
	movs r4, #0
	ldrsh r1, [r0, r4]
	ldr r0, _080853A4 @ =gUnknown_08499598
	ldr r4, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrb r1, [r0, #0x1d]
	lsls r0, r1, #6
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r3, #0xc0
	adds r0, r0, r3
	ldr r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r3, [r0]
	movs r0, #0x80
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #3
	movs r1, #5
	bl sub_080149C0
_0808538A:
	bl sub_08013AEC
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08085398: .4byte gUnknown_03005940
_0808539C: .4byte gUnknown_08499578
_080853A0: .4byte gUnknown_08616F0C
_080853A4: .4byte gUnknown_08499598
_080853A8: .4byte gUnknown_08610A38
_080853AC: .4byte gUnknown_085D3DD0

