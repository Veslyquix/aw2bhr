	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801ABF8
sub_0801ABF8: @ 0x0801ABF8
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0
	beq _0801AC50
	ldr r1, _0801AC44 @ =gUnknown_0200CC24
	ldr r4, _0801AC48 @ =gUnknown_0808EF58
	ldr r0, [r4]
	ldr r0, [r0]
	ldr r1, [r1]
	bl _call_via_r1
	adds r6, r0, #0
	adds r7, r4, #0
	movs r4, #0xff
	ldr r3, _0801AC4C @ =gUnknown_0200CC38
	movs r2, #0xf
_0801AC1A:
	ldrb r1, [r3]
	cmp r1, r5
	bne _0801AC2C
	ldrb r0, [r3, #0x10]
	orrs r0, r4
	strb r0, [r3, #0x10]
	adds r0, r1, #0
	orrs r0, r4
	strb r0, [r3]
_0801AC2C:
	adds r3, #1
	subs r2, #1
	cmp r2, #0
	bge _0801AC1A
	ldr r0, [r7]
	ldr r1, [r0]
	movs r0, #0
	adds r2, r6, #0
	bl sub_0801A7D8
	b _0801AC52
	.align 2, 0
_0801AC44: .4byte gUnknown_0200CC24
_0801AC48: .4byte gUnknown_0808EF58
_0801AC4C: .4byte gUnknown_0200CC38
_0801AC50:
	movs r0, #1
_0801AC52:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

