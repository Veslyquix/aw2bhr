	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08087548
sub_08087548: @ 0x08087548
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r3, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	movs r5, #0
	cmp r5, r6
	bge _08087592
	ldr r0, _0808759C @ =gUnknown_0200C078
	mov r8, r0
	ldr r0, _080875A0 @ =gUnknown_02027F74
	adds r0, #4
	adds r4, r3, r0
_08087564:
	ldrb r0, [r4]
	subs r0, #0x6c
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #2
	add r1, r8
	ldr r0, [r1]
	lsls r0, r0, #0xc
	lsrs r0, r0, #0x14
	cmp r0, #0
	beq _0808758A
	ldrh r0, [r1, #2]
	lsrs r0, r0, #4
	bl sub_08037D80
	adds r1, r5, #0
	adds r2, r7, #0
	bl sub_08087514
_0808758A:
	adds r4, #1
	adds r5, #1
	cmp r5, r6
	blt _08087564
_08087592:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808759C: .4byte gUnknown_0200C078
_080875A0: .4byte gUnknown_02027F74

