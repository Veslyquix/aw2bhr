	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0808AE54
sub_0808AE54: @ 0x0808AE54
	push {r4, r5, r6, r7, lr}
	sub sp, #0x80
	adds r5, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r2, _0808AE84 @ =0x04000204
	ldrh r0, [r2]
	ldr r1, _0808AE88 @ =0x0000FFFC
	ands r0, r1
	movs r1, #3
	orrs r0, r1
	strh r0, [r2]
	ldr r3, _0808AE8C @ =sub_0808AE30
	movs r0, #1
	eors r3, r0
	mov r2, sp
	ldr r0, _0808AE90 @ =sub_0808AE54
	ldr r1, _0808AE8C @ =sub_0808AE30
	subs r0, r0, r1
	lsls r0, r0, #0xf
	b _0808AEA0
	.align 2, 0
_0808AE84: .4byte 0x04000204
_0808AE88: .4byte 0x0000FFFC
_0808AE8C: .4byte sub_0808AE30
_0808AE90: .4byte sub_0808AE54
_0808AE94:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	subs r0, r1, #1
	lsls r0, r0, #0x10
_0808AEA0:
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _0808AE94
	mov r3, sp
	adds r3, #1
	ldr r0, _0808AECC @ =gUnknown_08485550
	ldrb r0, [r0, #0x1c]
	lsls r4, r0
	adds r0, r4, #0
	movs r2, #0xe0
	lsls r2, r2, #0x14
	adds r1, r5, r2
	adds r0, r0, r1
	adds r1, r6, #0
	adds r2, r7, #0
	bl _call_via_r3
	add sp, #0x80
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808AECC: .4byte gUnknown_08485550

