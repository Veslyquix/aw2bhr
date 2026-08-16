	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08014EF4
sub_08014EF4: @ 0x08014EF4
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	cmp r6, #0
	bne _08014F06
	adds r0, r5, #0
	bl sub_08014E44
	b _08014FA8
_08014F06:
	cmp r5, #0
	bne _08014F14
	adds r0, r6, #0
	bl sub_08014ED4
_08014F10:
	movs r0, #0
	b _08014FA8
_08014F14:
	adds r5, #0xf
	movs r0, #0x10
	rsbs r0, r0, #0
	ands r5, r0
	adds r4, r6, #0
	subs r4, #0x10
	ldr r1, _08014F7C @ =gUnknown_0808E52C
	ldr r7, [r1]
	str r4, [r7]
	adds r0, r6, #0
	subs r0, #8
	ldr r0, [r0]
	mov ip, r1
	cmp r0, #0
	beq _08014F10
	ldr r2, [r4]
	adds r0, r6, #0
	subs r0, #0xc
	ldr r3, [r0]
	str r2, [r7]
	cmp r2, #0
	beq _08014F50
	ldr r0, [r2, #8]
	cmp r0, #0
	bne _08014F50
	adds r1, r3, #0
	adds r1, #0x10
	ldr r0, [r2, #4]
	adds r3, r1, r0
	ldr r2, [r2]
_08014F50:
	mov r0, ip
	ldr r7, [r0]
	str r4, [r7]
	cmp r5, r3
	bls _08014F80
	adds r0, r5, #0
	bl sub_08014E44
	adds r4, r0, #0
	cmp r4, #0
	beq _08014F10
	adds r0, r4, #0
	adds r1, r6, #0
	adds r2, r5, #0
	bl sub_0808B6E8
	adds r0, r6, #0
	bl sub_08014ED4
	adds r0, r4, #0
	b _08014FA8
	.align 2, 0
_08014F7C: .4byte gUnknown_0808E52C
_08014F80:
	adds r0, r5, #0
	adds r0, #0x20
	cmp r0, r3
	bhs _08014FA2
	adds r1, r6, r5
	adds r0, r1, #0
	adds r0, #0x10
	str r0, [r4]
	str r5, [r4, #4]
	str r0, [r7]
	str r2, [r1, #0x10]
	subs r0, r3, r5
	subs r0, #0x10
	str r0, [r1, #0x14]
	movs r0, #0
	str r0, [r1, #0x18]
	b _08014FA6
_08014FA2:
	str r2, [r4]
	str r3, [r4, #4]
_08014FA6:
	adds r0, r6, #0
_08014FA8:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

