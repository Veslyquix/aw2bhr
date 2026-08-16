	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08003640
sub_08003640: @ 0x08003640
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r1, _08003690 @ =gUnknown_0808D77C
	mov r0, sp
	movs r2, #4
	bl sub_0808B6E8
	movs r4, #0
	ldr r6, _08003694 @ =gUnknown_0808D780
	ldr r0, _08003698 @ =gUnknown_08485C9C
	adds r5, r0, #4
_08003656:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	movs r1, #0
	bl sub_0802A880
	adds r0, #0x40
	adds r4, #1
	ldr r1, [r5]
	lsls r1, r1, #5
	ldr r2, _0800369C @ =0x06010000
	adds r1, r1, r2
	movs r2, #0xc0
	bl sub_08011E54
	ldm r5!, {r1}
	lsls r1, r1, #5
	ldr r0, _080036A0 @ =0x060100C0
	adds r1, r1, r0
	ldr r0, [r6]
	movs r2, #0x40
	bl sub_08011E54
	cmp r4, #3
	ble _08003656
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08003690: .4byte gUnknown_0808D77C
_08003694: .4byte gUnknown_0808D780
_08003698: .4byte gUnknown_08485C9C
_0800369C: .4byte 0x06010000
_080036A0: .4byte 0x060100C0

