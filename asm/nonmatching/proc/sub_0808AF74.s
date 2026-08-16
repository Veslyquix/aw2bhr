	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0808AF74
sub_0808AF74: @ 0x0808AF74
	push {r4, r5, r6, lr}
	sub sp, #0x100
	adds r5, r1, #0
	adds r6, r2, #0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r2, _0808AFA0 @ =0x04000204
	ldrh r0, [r2]
	ldr r1, _0808AFA4 @ =0x0000FFFC
	ands r0, r1
	movs r1, #3
	orrs r0, r1
	strh r0, [r2]
	ldr r3, _0808AFA8 @ =sub_0808AED0
	movs r0, #1
	eors r3, r0
	mov r2, sp
	ldr r0, _0808AFAC @ =sub_0808AF00
	ldr r1, _0808AFA8 @ =sub_0808AED0
	subs r0, r0, r1
	lsls r0, r0, #0xf
	b _0808AFBC
	.align 2, 0
_0808AFA0: .4byte 0x04000204
_0808AFA4: .4byte 0x0000FFFC
_0808AFA8: .4byte sub_0808AED0
_0808AFAC: .4byte sub_0808AF00
_0808AFB0:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	subs r0, r1, #1
	lsls r0, r0, #0x10
_0808AFBC:
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _0808AFB0
	mov r3, sp
	adds r3, #1
	ldr r0, _0808AFE4 @ =gUnknown_08485550
	ldrb r1, [r0, #0x1c]
	lsls r4, r1
	adds r1, r4, #0
	movs r0, #0xe0
	lsls r0, r0, #0x14
	adds r1, r1, r0
	adds r0, r5, #0
	adds r2, r6, #0
	bl _call_via_r3
	add sp, #0x100
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0808AFE4: .4byte gUnknown_08485550

