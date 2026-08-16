	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08019B80
sub_08019B80: @ 0x08019B80
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	movs r7, #0
	adds r0, #0x41
	ldrb r5, [r0]
	cmp r5, #1
	bls _08019C06
	ldr r1, _08019C0C @ =gUnknown_0808E5B8
	ldr r0, [r1]
	ldr r3, [r0]
	ldrh r4, [r3, #2]
	movs r0, #0x40
	ands r0, r4
	mov r8, r1
	cmp r0, #0
	beq _08019BC6
	adds r0, r6, #0
	adds r0, #0x42
	ldrb r1, [r0]
	adds r2, r0, #0
	cmp r1, #0
	bne _08019BB8
	ldrh r3, [r3, #4]
	cmp r4, r3
	bne _08019C06
	strb r5, [r2]
_08019BB8:
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	movs r7, #1
	movs r0, #0x67
	bl sub_0803B4DC
_08019BC6:
	mov r1, r8
	ldr r0, [r1]
	ldr r4, [r0]
	ldrh r5, [r4, #2]
	movs r0, #0x80
	ands r0, r5
	cmp r0, #0
	beq _08019C02
	adds r1, r6, #0
	adds r1, #0x42
	ldrb r3, [r1]
	adds r0, r6, #0
	adds r0, #0x41
	ldrb r0, [r0]
	subs r0, #1
	adds r2, r1, #0
	cmp r3, r0
	bne _08019BF4
	ldrh r4, [r4, #4]
	cmp r5, r4
	bne _08019C06
	movs r0, #0xff
	strb r0, [r2]
_08019BF4:
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	movs r7, #1
	movs r0, #0x67
	bl sub_0803B4DC
_08019C02:
	cmp r7, #1
	beq _08019C10
_08019C06:
	movs r0, #0
	b _08019C18
	.align 2, 0
_08019C0C: .4byte gUnknown_0808E5B8
_08019C10:
	adds r0, r6, #0
	bl sub_08019B50
	movs r0, #1
_08019C18:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

