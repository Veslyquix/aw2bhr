	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08004724
sub_08004724: @ 0x08004724
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldr r1, _080047C0 @ =gUnknown_0808D7A0
	mov r0, sp
	movs r2, #8
	bl sub_0808B6E8
	ldr r0, _080047C4 @ =gUnknown_08486FC4
	mov sb, r0
	movs r5, #0
	ldr r0, _080047C8 @ =gUnknown_0808D7A8
	ldr r2, [r0]
	ldr r1, [r2]
	ldrh r1, [r1, #2]
	cmp r5, r1
	bge _080047A8
	mov sl, r2
_0800474E:
	movs r4, #0
	mov r1, sl
	ldr r0, [r1]
	adds r6, r5, #1
	ldrh r0, [r0]
	cmp r4, r0
	bge _0800479C
	ldr r7, _080047CC @ =gUnknown_08499590
	lsls r5, r5, #1
	str r5, [sp, #8]
	ldr r5, _080047D0 @ =0x0000417A
	mov r8, r5
	ldr r0, _080047D4 @ =0x00000A22
	mov ip, r0
_0800476A:
	ldr r2, [r7]
	mov r1, r8
	adds r3, r2, r1
	ldr r5, [sp, #8]
	adds r3, r3, r5
	ldrh r0, [r3]
	adds r0, r0, r4
	lsls r0, r0, #1
	mov r5, ip
	adds r1, r2, r5
	adds r1, r1, r0
	movs r0, #0x2a
	strh r0, [r1]
	ldrh r0, [r3]
	adds r0, r0, r4
	ldr r1, _080047D8 @ =0x00001432
	adds r2, r2, r1
	adds r2, r2, r0
	movs r5, #7
	strb r5, [r2]
	adds r4, #1
	ldr r0, [r7]
	ldrh r0, [r0]
	cmp r4, r0
	blt _0800476A
_0800479C:
	adds r5, r6, #0
	mov r1, sl
	ldr r0, [r1]
	ldrh r0, [r0, #2]
	cmp r5, r0
	blt _0800474E
_080047A8:
	movs r5, #0
	ldr r1, _080047CC @ =gUnknown_08499590
	ldr r0, [r1]
	ldrh r0, [r0, #2]
	cmp r5, r0
	bge _08004806
	adds r7, r1, #0
_080047B6:
	movs r4, #0
	ldr r0, [r7]
	adds r6, r5, #1
	b _080047F6
	.align 2, 0
_080047C0: .4byte gUnknown_0808D7A0
_080047C4: .4byte gUnknown_08486FC4
_080047C8: .4byte gUnknown_0808D7A8
_080047CC: .4byte gUnknown_08499590
_080047D0: .4byte 0x0000417A
_080047D4: .4byte 0x00000A22
_080047D8: .4byte 0x00001432
_080047DC:
	mov r1, sb
	ldrb r0, [r1]
	lsls r0, r0, #1
	add r0, sp
	ldrh r2, [r0]
	movs r0, #1
	add sb, r0
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08003F44
	adds r4, #1
	ldr r0, [r7]
_080047F6:
	ldrh r0, [r0]
	cmp r4, r0
	blt _080047DC
	adds r5, r6, #0
	ldr r0, [r7]
	ldrh r0, [r0, #2]
	cmp r5, r0
	blt _080047B6
_08004806:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

